# Explore: explore_2551
# Auto-generated LookML Explore File

include: "/views/domain_04/view_07654.view.lkml"
include: "/views/domain_06/view_07656.view.lkml"
include: "/views/domain_07/view_07657.view.lkml"
include: "/views/domain_08/view_07658.view.lkml"

explore: explore_2551 {
  label: "Explore Explore 2551"
  description: "Comprehensive analytics explore joining base view_07654 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_07654
  
  always_filter: {
    filters: [view_07654.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07654.created_at_date: "7 days"]
    unless: [view_07654.id, view_07654.status]
  }

  join: view_07656 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07654.user_id} = ${view_07656.id} ;;
    required_joins: []
  }

  join: view_07657 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07654.account_id} = ${view_07657.account_id} ;;
    required_joins: [view_07656]
  }

  join: view_07658 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07654.category} = ${view_07658.category} ;;
  }

  access_filter: {
    field: view_07654.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07654.is_deleted} = false ;;
}
