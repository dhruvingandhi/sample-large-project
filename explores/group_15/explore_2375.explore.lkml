# Explore: explore_2375
# Auto-generated LookML Explore File

include: "/views/domain_26/view_07126.view.lkml"
include: "/views/domain_28/view_07128.view.lkml"
include: "/views/domain_29/view_07129.view.lkml"
include: "/views/domain_30/view_07130.view.lkml"

explore: explore_2375 {
  label: "Explore Explore 2375"
  description: "Comprehensive analytics explore joining base view_07126 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_07126
  
  always_filter: {
    filters: [view_07126.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07126.created_at_date: "7 days"]
    unless: [view_07126.id, view_07126.status]
  }

  join: view_07128 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07126.user_id} = ${view_07128.id} ;;
    required_joins: []
  }

  join: view_07129 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07126.account_id} = ${view_07129.account_id} ;;
    required_joins: [view_07128]
  }

  join: view_07130 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07126.category} = ${view_07130.category} ;;
  }

  access_filter: {
    field: view_07126.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07126.is_deleted} = false ;;
}
