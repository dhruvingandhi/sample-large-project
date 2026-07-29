# Explore: explore_0863
# Auto-generated LookML Explore File

include: "/views/domain_40/view_02590.view.lkml"
include: "/views/domain_42/view_02592.view.lkml"
include: "/views/domain_43/view_02593.view.lkml"
include: "/views/domain_44/view_02594.view.lkml"

explore: explore_0863 {
  label: "Explore Explore 0863"
  description: "Comprehensive analytics explore joining base view_02590 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_02590
  
  always_filter: {
    filters: [view_02590.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02590.created_at_date: "7 days"]
    unless: [view_02590.id, view_02590.status]
  }

  join: view_02592 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02590.user_id} = ${view_02592.id} ;;
    required_joins: []
  }

  join: view_02593 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02590.account_id} = ${view_02593.account_id} ;;
    required_joins: [view_02592]
  }

  join: view_02594 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02590.category} = ${view_02594.category} ;;
  }

  access_filter: {
    field: view_02590.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02590.is_deleted} = false ;;
}
