# Explore: explore_3247
# Auto-generated LookML Explore File

include: "/views/domain_42/view_09742.view.lkml"
include: "/views/domain_44/view_09744.view.lkml"
include: "/views/domain_45/view_09745.view.lkml"
include: "/views/domain_46/view_09746.view.lkml"

explore: explore_3247 {
  label: "Explore Explore 3247"
  description: "Comprehensive analytics explore joining base view_09742 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_09742
  
  always_filter: {
    filters: [view_09742.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09742.created_at_date: "7 days"]
    unless: [view_09742.id, view_09742.status]
  }

  join: view_09744 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09742.user_id} = ${view_09744.id} ;;
    required_joins: []
  }

  join: view_09745 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09742.account_id} = ${view_09745.account_id} ;;
    required_joins: [view_09744]
  }

  join: view_09746 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09742.category} = ${view_09746.category} ;;
  }

  access_filter: {
    field: view_09742.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09742.is_deleted} = false ;;
}
