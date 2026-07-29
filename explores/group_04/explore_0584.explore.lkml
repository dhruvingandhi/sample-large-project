# Explore: explore_0584
# Auto-generated LookML Explore File

include: "/views/domain_03/view_01753.view.lkml"
include: "/views/domain_05/view_01755.view.lkml"
include: "/views/domain_06/view_01756.view.lkml"
include: "/views/domain_07/view_01757.view.lkml"

explore: explore_0584 {
  label: "Explore Explore 0584"
  description: "Comprehensive analytics explore joining base view_01753 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_01753
  
  always_filter: {
    filters: [view_01753.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01753.created_at_date: "7 days"]
    unless: [view_01753.id, view_01753.status]
  }

  join: view_01755 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01753.user_id} = ${view_01755.id} ;;
    required_joins: []
  }

  join: view_01756 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01753.account_id} = ${view_01756.account_id} ;;
    required_joins: [view_01755]
  }

  join: view_01757 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01753.category} = ${view_01757.category} ;;
  }

  access_filter: {
    field: view_01753.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01753.is_deleted} = false ;;
}
