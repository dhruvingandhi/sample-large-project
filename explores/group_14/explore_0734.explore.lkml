# Explore: explore_0734
# Auto-generated LookML Explore File

include: "/views/domain_03/view_02203.view.lkml"
include: "/views/domain_05/view_02205.view.lkml"
include: "/views/domain_06/view_02206.view.lkml"
include: "/views/domain_07/view_02207.view.lkml"

explore: explore_0734 {
  label: "Explore Explore 0734"
  description: "Comprehensive analytics explore joining base view_02203 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_02203
  
  always_filter: {
    filters: [view_02203.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02203.created_at_date: "7 days"]
    unless: [view_02203.id, view_02203.status]
  }

  join: view_02205 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02203.user_id} = ${view_02205.id} ;;
    required_joins: []
  }

  join: view_02206 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02203.account_id} = ${view_02206.account_id} ;;
    required_joins: [view_02205]
  }

  join: view_02207 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02203.category} = ${view_02207.category} ;;
  }

  access_filter: {
    field: view_02203.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02203.is_deleted} = false ;;
}
