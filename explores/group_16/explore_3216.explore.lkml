# Explore: explore_3216
# Auto-generated LookML Explore File

include: "/views/domain_49/view_09649.view.lkml"
include: "/views/domain_01/view_09651.view.lkml"
include: "/views/domain_02/view_09652.view.lkml"
include: "/views/domain_03/view_09653.view.lkml"

explore: explore_3216 {
  label: "Explore Explore 3216"
  description: "Comprehensive analytics explore joining base view_09649 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_09649
  
  always_filter: {
    filters: [view_09649.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09649.created_at_date: "7 days"]
    unless: [view_09649.id, view_09649.status]
  }

  join: view_09651 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09649.user_id} = ${view_09651.id} ;;
    required_joins: []
  }

  join: view_09652 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09649.account_id} = ${view_09652.account_id} ;;
    required_joins: [view_09651]
  }

  join: view_09653 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09649.category} = ${view_09653.category} ;;
  }

  access_filter: {
    field: view_09649.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09649.is_deleted} = false ;;
}
