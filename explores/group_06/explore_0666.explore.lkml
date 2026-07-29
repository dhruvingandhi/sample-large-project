# Explore: explore_0666
# Auto-generated LookML Explore File

include: "/views/domain_49/view_01999.view.lkml"
include: "/views/domain_01/view_02001.view.lkml"
include: "/views/domain_02/view_02002.view.lkml"
include: "/views/domain_03/view_02003.view.lkml"

explore: explore_0666 {
  label: "Explore Explore 0666"
  description: "Comprehensive analytics explore joining base view_01999 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_01999
  
  always_filter: {
    filters: [view_01999.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01999.created_at_date: "7 days"]
    unless: [view_01999.id, view_01999.status]
  }

  join: view_02001 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01999.user_id} = ${view_02001.id} ;;
    required_joins: []
  }

  join: view_02002 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01999.account_id} = ${view_02002.account_id} ;;
    required_joins: [view_02001]
  }

  join: view_02003 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01999.category} = ${view_02003.category} ;;
  }

  access_filter: {
    field: view_01999.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01999.is_deleted} = false ;;
}
