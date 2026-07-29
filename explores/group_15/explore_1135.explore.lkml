# Explore: explore_1135
# Auto-generated LookML Explore File

include: "/views/domain_06/view_03406.view.lkml"
include: "/views/domain_08/view_03408.view.lkml"
include: "/views/domain_09/view_03409.view.lkml"
include: "/views/domain_10/view_03410.view.lkml"

explore: explore_1135 {
  label: "Explore Explore 1135"
  description: "Comprehensive analytics explore joining base view_03406 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_03406
  
  always_filter: {
    filters: [view_03406.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03406.created_at_date: "7 days"]
    unless: [view_03406.id, view_03406.status]
  }

  join: view_03408 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03406.user_id} = ${view_03408.id} ;;
    required_joins: []
  }

  join: view_03409 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03406.account_id} = ${view_03409.account_id} ;;
    required_joins: [view_03408]
  }

  join: view_03410 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03406.category} = ${view_03410.category} ;;
  }

  access_filter: {
    field: view_03406.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03406.is_deleted} = false ;;
}
