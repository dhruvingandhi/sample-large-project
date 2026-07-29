# Explore: explore_2135
# Auto-generated LookML Explore File

include: "/views/domain_06/view_06406.view.lkml"
include: "/views/domain_08/view_06408.view.lkml"
include: "/views/domain_09/view_06409.view.lkml"
include: "/views/domain_10/view_06410.view.lkml"

explore: explore_2135 {
  label: "Explore Explore 2135"
  description: "Comprehensive analytics explore joining base view_06406 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_06406
  
  always_filter: {
    filters: [view_06406.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06406.created_at_date: "7 days"]
    unless: [view_06406.id, view_06406.status]
  }

  join: view_06408 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06406.user_id} = ${view_06408.id} ;;
    required_joins: []
  }

  join: view_06409 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06406.account_id} = ${view_06409.account_id} ;;
    required_joins: [view_06408]
  }

  join: view_06410 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06406.category} = ${view_06410.category} ;;
  }

  access_filter: {
    field: view_06406.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06406.is_deleted} = false ;;
}
