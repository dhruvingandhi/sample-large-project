# Explore: explore_0405
# Auto-generated LookML Explore File

include: "/views/domain_16/view_01216.view.lkml"
include: "/views/domain_18/view_01218.view.lkml"
include: "/views/domain_19/view_01219.view.lkml"
include: "/views/domain_20/view_01220.view.lkml"

explore: explore_0405 {
  label: "Explore Explore 0405"
  description: "Comprehensive analytics explore joining base view_01216 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_01216
  
  always_filter: {
    filters: [view_01216.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01216.created_at_date: "7 days"]
    unless: [view_01216.id, view_01216.status]
  }

  join: view_01218 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01216.user_id} = ${view_01218.id} ;;
    required_joins: []
  }

  join: view_01219 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01216.account_id} = ${view_01219.account_id} ;;
    required_joins: [view_01218]
  }

  join: view_01220 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01216.category} = ${view_01220.category} ;;
  }

  access_filter: {
    field: view_01216.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01216.is_deleted} = false ;;
}
