# Explore: explore_0997
# Auto-generated LookML Explore File

include: "/views/domain_42/view_02992.view.lkml"
include: "/views/domain_44/view_02994.view.lkml"
include: "/views/domain_45/view_02995.view.lkml"
include: "/views/domain_46/view_02996.view.lkml"

explore: explore_0997 {
  label: "Explore Explore 0997"
  description: "Comprehensive analytics explore joining base view_02992 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_02992
  
  always_filter: {
    filters: [view_02992.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02992.created_at_date: "7 days"]
    unless: [view_02992.id, view_02992.status]
  }

  join: view_02994 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02992.user_id} = ${view_02994.id} ;;
    required_joins: []
  }

  join: view_02995 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02992.account_id} = ${view_02995.account_id} ;;
    required_joins: [view_02994]
  }

  join: view_02996 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02992.category} = ${view_02996.category} ;;
  }

  access_filter: {
    field: view_02992.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02992.is_deleted} = false ;;
}
