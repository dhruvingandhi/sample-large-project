# Explore: explore_1763
# Auto-generated LookML Explore File

include: "/views/domain_40/view_05290.view.lkml"
include: "/views/domain_42/view_05292.view.lkml"
include: "/views/domain_43/view_05293.view.lkml"
include: "/views/domain_44/view_05294.view.lkml"

explore: explore_1763 {
  label: "Explore Explore 1763"
  description: "Comprehensive analytics explore joining base view_05290 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_05290
  
  always_filter: {
    filters: [view_05290.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05290.created_at_date: "7 days"]
    unless: [view_05290.id, view_05290.status]
  }

  join: view_05292 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05290.user_id} = ${view_05292.id} ;;
    required_joins: []
  }

  join: view_05293 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05290.account_id} = ${view_05293.account_id} ;;
    required_joins: [view_05292]
  }

  join: view_05294 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05290.category} = ${view_05294.category} ;;
  }

  access_filter: {
    field: view_05290.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05290.is_deleted} = false ;;
}
