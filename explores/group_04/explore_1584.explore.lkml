# Explore: explore_1584
# Auto-generated LookML Explore File

include: "/views/domain_03/view_04753.view.lkml"
include: "/views/domain_05/view_04755.view.lkml"
include: "/views/domain_06/view_04756.view.lkml"
include: "/views/domain_07/view_04757.view.lkml"

explore: explore_1584 {
  label: "Explore Explore 1584"
  description: "Comprehensive analytics explore joining base view_04753 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_04753
  
  always_filter: {
    filters: [view_04753.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04753.created_at_date: "7 days"]
    unless: [view_04753.id, view_04753.status]
  }

  join: view_04755 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04753.user_id} = ${view_04755.id} ;;
    required_joins: []
  }

  join: view_04756 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04753.account_id} = ${view_04756.account_id} ;;
    required_joins: [view_04755]
  }

  join: view_04757 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04753.category} = ${view_04757.category} ;;
  }

  access_filter: {
    field: view_04753.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04753.is_deleted} = false ;;
}
