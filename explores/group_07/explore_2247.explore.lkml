# Explore: explore_2247
# Auto-generated LookML Explore File

include: "/views/domain_42/view_06742.view.lkml"
include: "/views/domain_44/view_06744.view.lkml"
include: "/views/domain_45/view_06745.view.lkml"
include: "/views/domain_46/view_06746.view.lkml"

explore: explore_2247 {
  label: "Explore Explore 2247"
  description: "Comprehensive analytics explore joining base view_06742 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_06742
  
  always_filter: {
    filters: [view_06742.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06742.created_at_date: "7 days"]
    unless: [view_06742.id, view_06742.status]
  }

  join: view_06744 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06742.user_id} = ${view_06744.id} ;;
    required_joins: []
  }

  join: view_06745 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06742.account_id} = ${view_06745.account_id} ;;
    required_joins: [view_06744]
  }

  join: view_06746 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06742.category} = ${view_06746.category} ;;
  }

  access_filter: {
    field: view_06742.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06742.is_deleted} = false ;;
}
