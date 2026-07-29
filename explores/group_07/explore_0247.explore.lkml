# Explore: explore_0247
# Auto-generated LookML Explore File

include: "/views/domain_42/view_00742.view.lkml"
include: "/views/domain_44/view_00744.view.lkml"
include: "/views/domain_45/view_00745.view.lkml"
include: "/views/domain_46/view_00746.view.lkml"

explore: explore_0247 {
  label: "Explore Explore 0247"
  description: "Comprehensive analytics explore joining base view_00742 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_00742
  
  always_filter: {
    filters: [view_00742.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00742.created_at_date: "7 days"]
    unless: [view_00742.id, view_00742.status]
  }

  join: view_00744 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00742.user_id} = ${view_00744.id} ;;
    required_joins: []
  }

  join: view_00745 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00742.account_id} = ${view_00745.account_id} ;;
    required_joins: [view_00744]
  }

  join: view_00746 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00742.category} = ${view_00746.category} ;;
  }

  access_filter: {
    field: view_00742.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00742.is_deleted} = false ;;
}
