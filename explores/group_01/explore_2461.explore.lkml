# Explore: explore_2461
# Auto-generated LookML Explore File

include: "/views/domain_34/view_07384.view.lkml"
include: "/views/domain_36/view_07386.view.lkml"
include: "/views/domain_37/view_07387.view.lkml"
include: "/views/domain_38/view_07388.view.lkml"

explore: explore_2461 {
  label: "Explore Explore 2461"
  description: "Comprehensive analytics explore joining base view_07384 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_07384
  
  always_filter: {
    filters: [view_07384.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07384.created_at_date: "7 days"]
    unless: [view_07384.id, view_07384.status]
  }

  join: view_07386 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07384.user_id} = ${view_07386.id} ;;
    required_joins: []
  }

  join: view_07387 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07384.account_id} = ${view_07387.account_id} ;;
    required_joins: [view_07386]
  }

  join: view_07388 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07384.category} = ${view_07388.category} ;;
  }

  access_filter: {
    field: view_07384.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07384.is_deleted} = false ;;
}
