# Explore: explore_2856
# Auto-generated LookML Explore File

include: "/views/domain_19/view_08569.view.lkml"
include: "/views/domain_21/view_08571.view.lkml"
include: "/views/domain_22/view_08572.view.lkml"
include: "/views/domain_23/view_08573.view.lkml"

explore: explore_2856 {
  label: "Explore Explore 2856"
  description: "Comprehensive analytics explore joining base view_08569 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_08569
  
  always_filter: {
    filters: [view_08569.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08569.created_at_date: "7 days"]
    unless: [view_08569.id, view_08569.status]
  }

  join: view_08571 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08569.user_id} = ${view_08571.id} ;;
    required_joins: []
  }

  join: view_08572 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08569.account_id} = ${view_08572.account_id} ;;
    required_joins: [view_08571]
  }

  join: view_08573 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08569.category} = ${view_08573.category} ;;
  }

  access_filter: {
    field: view_08569.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08569.is_deleted} = false ;;
}
