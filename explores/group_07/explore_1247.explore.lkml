# Explore: explore_1247
# Auto-generated LookML Explore File

include: "/views/domain_42/view_03742.view.lkml"
include: "/views/domain_44/view_03744.view.lkml"
include: "/views/domain_45/view_03745.view.lkml"
include: "/views/domain_46/view_03746.view.lkml"

explore: explore_1247 {
  label: "Explore Explore 1247"
  description: "Comprehensive analytics explore joining base view_03742 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_03742
  
  always_filter: {
    filters: [view_03742.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03742.created_at_date: "7 days"]
    unless: [view_03742.id, view_03742.status]
  }

  join: view_03744 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03742.user_id} = ${view_03744.id} ;;
    required_joins: []
  }

  join: view_03745 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03742.account_id} = ${view_03745.account_id} ;;
    required_joins: [view_03744]
  }

  join: view_03746 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03742.category} = ${view_03746.category} ;;
  }

  access_filter: {
    field: view_03742.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03742.is_deleted} = false ;;
}
