# Explore: explore_3731
# Auto-generated LookML Explore File

include: "/views/domain_44/view_11194.view.lkml"
include: "/views/domain_46/view_11196.view.lkml"
include: "/views/domain_47/view_11197.view.lkml"
include: "/views/domain_48/view_11198.view.lkml"

explore: explore_3731 {
  label: "Explore Explore 3731"
  description: "Comprehensive analytics explore joining base view_11194 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_11194
  
  always_filter: {
    filters: [view_11194.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11194.created_at_date: "7 days"]
    unless: [view_11194.id, view_11194.status]
  }

  join: view_11196 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11194.user_id} = ${view_11196.id} ;;
    required_joins: []
  }

  join: view_11197 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11194.account_id} = ${view_11197.account_id} ;;
    required_joins: [view_11196]
  }

  join: view_11198 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11194.category} = ${view_11198.category} ;;
  }

  access_filter: {
    field: view_11194.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11194.is_deleted} = false ;;
}
