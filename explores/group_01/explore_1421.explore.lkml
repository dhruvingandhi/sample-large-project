# Explore: explore_1421
# Auto-generated LookML Explore File

include: "/views/domain_14/view_04264.view.lkml"
include: "/views/domain_16/view_04266.view.lkml"
include: "/views/domain_17/view_04267.view.lkml"
include: "/views/domain_18/view_04268.view.lkml"

explore: explore_1421 {
  label: "Explore Explore 1421"
  description: "Comprehensive analytics explore joining base view_04264 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_04264
  
  always_filter: {
    filters: [view_04264.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04264.created_at_date: "7 days"]
    unless: [view_04264.id, view_04264.status]
  }

  join: view_04266 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04264.user_id} = ${view_04266.id} ;;
    required_joins: []
  }

  join: view_04267 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04264.account_id} = ${view_04267.account_id} ;;
    required_joins: [view_04266]
  }

  join: view_04268 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04264.category} = ${view_04268.category} ;;
  }

  access_filter: {
    field: view_04264.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04264.is_deleted} = false ;;
}
