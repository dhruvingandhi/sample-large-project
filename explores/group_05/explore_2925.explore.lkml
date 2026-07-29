# Explore: explore_2925
# Auto-generated LookML Explore File

include: "/views/domain_26/view_08776.view.lkml"
include: "/views/domain_28/view_08778.view.lkml"
include: "/views/domain_29/view_08779.view.lkml"
include: "/views/domain_30/view_08780.view.lkml"

explore: explore_2925 {
  label: "Explore Explore 2925"
  description: "Comprehensive analytics explore joining base view_08776 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_08776
  
  always_filter: {
    filters: [view_08776.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08776.created_at_date: "7 days"]
    unless: [view_08776.id, view_08776.status]
  }

  join: view_08778 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08776.user_id} = ${view_08778.id} ;;
    required_joins: []
  }

  join: view_08779 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08776.account_id} = ${view_08779.account_id} ;;
    required_joins: [view_08778]
  }

  join: view_08780 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08776.category} = ${view_08780.category} ;;
  }

  access_filter: {
    field: view_08776.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08776.is_deleted} = false ;;
}
