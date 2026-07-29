# Explore: explore_0794
# Auto-generated LookML Explore File

include: "/views/domain_33/view_02383.view.lkml"
include: "/views/domain_35/view_02385.view.lkml"
include: "/views/domain_36/view_02386.view.lkml"
include: "/views/domain_37/view_02387.view.lkml"

explore: explore_0794 {
  label: "Explore Explore 0794"
  description: "Comprehensive analytics explore joining base view_02383 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_02383
  
  always_filter: {
    filters: [view_02383.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02383.created_at_date: "7 days"]
    unless: [view_02383.id, view_02383.status]
  }

  join: view_02385 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02383.user_id} = ${view_02385.id} ;;
    required_joins: []
  }

  join: view_02386 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02383.account_id} = ${view_02386.account_id} ;;
    required_joins: [view_02385]
  }

  join: view_02387 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02383.category} = ${view_02387.category} ;;
  }

  access_filter: {
    field: view_02383.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02383.is_deleted} = false ;;
}
