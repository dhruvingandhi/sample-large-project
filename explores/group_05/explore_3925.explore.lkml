# Explore: explore_3925
# Auto-generated LookML Explore File

include: "/views/domain_26/view_11776.view.lkml"
include: "/views/domain_28/view_11778.view.lkml"
include: "/views/domain_29/view_11779.view.lkml"
include: "/views/domain_30/view_11780.view.lkml"

explore: explore_3925 {
  label: "Explore Explore 3925"
  description: "Comprehensive analytics explore joining base view_11776 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_11776
  
  always_filter: {
    filters: [view_11776.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11776.created_at_date: "7 days"]
    unless: [view_11776.id, view_11776.status]
  }

  join: view_11778 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11776.user_id} = ${view_11778.id} ;;
    required_joins: []
  }

  join: view_11779 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11776.account_id} = ${view_11779.account_id} ;;
    required_joins: [view_11778]
  }

  join: view_11780 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11776.category} = ${view_11780.category} ;;
  }

  access_filter: {
    field: view_11776.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11776.is_deleted} = false ;;
}
