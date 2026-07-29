# Explore: explore_2535
# Auto-generated LookML Explore File

include: "/views/domain_06/view_07606.view.lkml"
include: "/views/domain_08/view_07608.view.lkml"
include: "/views/domain_09/view_07609.view.lkml"
include: "/views/domain_10/view_07610.view.lkml"

explore: explore_2535 {
  label: "Explore Explore 2535"
  description: "Comprehensive analytics explore joining base view_07606 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_07606
  
  always_filter: {
    filters: [view_07606.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07606.created_at_date: "7 days"]
    unless: [view_07606.id, view_07606.status]
  }

  join: view_07608 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07606.user_id} = ${view_07608.id} ;;
    required_joins: []
  }

  join: view_07609 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07606.account_id} = ${view_07609.account_id} ;;
    required_joins: [view_07608]
  }

  join: view_07610 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07606.category} = ${view_07610.category} ;;
  }

  access_filter: {
    field: view_07606.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07606.is_deleted} = false ;;
}
