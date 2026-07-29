# Explore: explore_1997
# Auto-generated LookML Explore File

include: "/views/domain_42/view_05992.view.lkml"
include: "/views/domain_44/view_05994.view.lkml"
include: "/views/domain_45/view_05995.view.lkml"
include: "/views/domain_46/view_05996.view.lkml"

explore: explore_1997 {
  label: "Explore Explore 1997"
  description: "Comprehensive analytics explore joining base view_05992 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_05992
  
  always_filter: {
    filters: [view_05992.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05992.created_at_date: "7 days"]
    unless: [view_05992.id, view_05992.status]
  }

  join: view_05994 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05992.user_id} = ${view_05994.id} ;;
    required_joins: []
  }

  join: view_05995 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05992.account_id} = ${view_05995.account_id} ;;
    required_joins: [view_05994]
  }

  join: view_05996 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05992.category} = ${view_05996.category} ;;
  }

  access_filter: {
    field: view_05992.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05992.is_deleted} = false ;;
}
