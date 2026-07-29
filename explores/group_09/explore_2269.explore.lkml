# Explore: explore_2269
# Auto-generated LookML Explore File

include: "/views/domain_08/view_06808.view.lkml"
include: "/views/domain_10/view_06810.view.lkml"
include: "/views/domain_11/view_06811.view.lkml"
include: "/views/domain_12/view_06812.view.lkml"

explore: explore_2269 {
  label: "Explore Explore 2269"
  description: "Comprehensive analytics explore joining base view_06808 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_06808
  
  always_filter: {
    filters: [view_06808.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06808.created_at_date: "7 days"]
    unless: [view_06808.id, view_06808.status]
  }

  join: view_06810 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06808.user_id} = ${view_06810.id} ;;
    required_joins: []
  }

  join: view_06811 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06808.account_id} = ${view_06811.account_id} ;;
    required_joins: [view_06810]
  }

  join: view_06812 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06808.category} = ${view_06812.category} ;;
  }

  access_filter: {
    field: view_06808.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06808.is_deleted} = false ;;
}
