# Explore: explore_2642
# Auto-generated LookML Explore File

include: "/views/domain_27/view_07927.view.lkml"
include: "/views/domain_29/view_07929.view.lkml"
include: "/views/domain_30/view_07930.view.lkml"
include: "/views/domain_31/view_07931.view.lkml"

explore: explore_2642 {
  label: "Explore Explore 2642"
  description: "Comprehensive analytics explore joining base view_07927 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_07927
  
  always_filter: {
    filters: [view_07927.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07927.created_at_date: "7 days"]
    unless: [view_07927.id, view_07927.status]
  }

  join: view_07929 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07927.user_id} = ${view_07929.id} ;;
    required_joins: []
  }

  join: view_07930 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07927.account_id} = ${view_07930.account_id} ;;
    required_joins: [view_07929]
  }

  join: view_07931 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07927.category} = ${view_07931.category} ;;
  }

  access_filter: {
    field: view_07927.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07927.is_deleted} = false ;;
}
