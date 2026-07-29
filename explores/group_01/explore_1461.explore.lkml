# Explore: explore_1461
# Auto-generated LookML Explore File

include: "/views/domain_34/view_04384.view.lkml"
include: "/views/domain_36/view_04386.view.lkml"
include: "/views/domain_37/view_04387.view.lkml"
include: "/views/domain_38/view_04388.view.lkml"

explore: explore_1461 {
  label: "Explore Explore 1461"
  description: "Comprehensive analytics explore joining base view_04384 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_04384
  
  always_filter: {
    filters: [view_04384.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04384.created_at_date: "7 days"]
    unless: [view_04384.id, view_04384.status]
  }

  join: view_04386 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04384.user_id} = ${view_04386.id} ;;
    required_joins: []
  }

  join: view_04387 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04384.account_id} = ${view_04387.account_id} ;;
    required_joins: [view_04386]
  }

  join: view_04388 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04384.category} = ${view_04388.category} ;;
  }

  access_filter: {
    field: view_04384.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04384.is_deleted} = false ;;
}
