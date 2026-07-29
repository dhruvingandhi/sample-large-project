# Explore: explore_1628
# Auto-generated LookML Explore File

include: "/views/domain_35/view_04885.view.lkml"
include: "/views/domain_37/view_04887.view.lkml"
include: "/views/domain_38/view_04888.view.lkml"
include: "/views/domain_39/view_04889.view.lkml"

explore: explore_1628 {
  label: "Explore Explore 1628"
  description: "Comprehensive analytics explore joining base view_04885 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_04885
  
  always_filter: {
    filters: [view_04885.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04885.created_at_date: "7 days"]
    unless: [view_04885.id, view_04885.status]
  }

  join: view_04887 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04885.user_id} = ${view_04887.id} ;;
    required_joins: []
  }

  join: view_04888 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04885.account_id} = ${view_04888.account_id} ;;
    required_joins: [view_04887]
  }

  join: view_04889 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04885.category} = ${view_04889.category} ;;
  }

  access_filter: {
    field: view_04885.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04885.is_deleted} = false ;;
}
