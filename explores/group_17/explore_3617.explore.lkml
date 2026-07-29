# Explore: explore_3617
# Auto-generated LookML Explore File

include: "/views/domain_02/view_10852.view.lkml"
include: "/views/domain_04/view_10854.view.lkml"
include: "/views/domain_05/view_10855.view.lkml"
include: "/views/domain_06/view_10856.view.lkml"

explore: explore_3617 {
  label: "Explore Explore 3617"
  description: "Comprehensive analytics explore joining base view_10852 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_10852
  
  always_filter: {
    filters: [view_10852.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10852.created_at_date: "7 days"]
    unless: [view_10852.id, view_10852.status]
  }

  join: view_10854 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10852.user_id} = ${view_10854.id} ;;
    required_joins: []
  }

  join: view_10855 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10852.account_id} = ${view_10855.account_id} ;;
    required_joins: [view_10854]
  }

  join: view_10856 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10852.category} = ${view_10856.category} ;;
  }

  access_filter: {
    field: view_10852.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10852.is_deleted} = false ;;
}
