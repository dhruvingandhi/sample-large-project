# Explore: explore_2584
# Auto-generated LookML Explore File

include: "/views/domain_03/view_07753.view.lkml"
include: "/views/domain_05/view_07755.view.lkml"
include: "/views/domain_06/view_07756.view.lkml"
include: "/views/domain_07/view_07757.view.lkml"

explore: explore_2584 {
  label: "Explore Explore 2584"
  description: "Comprehensive analytics explore joining base view_07753 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_07753
  
  always_filter: {
    filters: [view_07753.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07753.created_at_date: "7 days"]
    unless: [view_07753.id, view_07753.status]
  }

  join: view_07755 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07753.user_id} = ${view_07755.id} ;;
    required_joins: []
  }

  join: view_07756 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07753.account_id} = ${view_07756.account_id} ;;
    required_joins: [view_07755]
  }

  join: view_07757 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07753.category} = ${view_07757.category} ;;
  }

  access_filter: {
    field: view_07753.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07753.is_deleted} = false ;;
}
