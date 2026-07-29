# Explore: explore_0744
# Auto-generated LookML Explore File

include: "/views/domain_33/view_02233.view.lkml"
include: "/views/domain_35/view_02235.view.lkml"
include: "/views/domain_36/view_02236.view.lkml"
include: "/views/domain_37/view_02237.view.lkml"

explore: explore_0744 {
  label: "Explore Explore 0744"
  description: "Comprehensive analytics explore joining base view_02233 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_02233
  
  always_filter: {
    filters: [view_02233.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02233.created_at_date: "7 days"]
    unless: [view_02233.id, view_02233.status]
  }

  join: view_02235 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02233.user_id} = ${view_02235.id} ;;
    required_joins: []
  }

  join: view_02236 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02233.account_id} = ${view_02236.account_id} ;;
    required_joins: [view_02235]
  }

  join: view_02237 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02233.category} = ${view_02237.category} ;;
  }

  access_filter: {
    field: view_02233.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02233.is_deleted} = false ;;
}
