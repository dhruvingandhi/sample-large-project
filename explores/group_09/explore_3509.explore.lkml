# Explore: explore_3509
# Auto-generated LookML Explore File

include: "/views/domain_28/view_10528.view.lkml"
include: "/views/domain_30/view_10530.view.lkml"
include: "/views/domain_31/view_10531.view.lkml"
include: "/views/domain_32/view_10532.view.lkml"

explore: explore_3509 {
  label: "Explore Explore 3509"
  description: "Comprehensive analytics explore joining base view_10528 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_10528
  
  always_filter: {
    filters: [view_10528.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10528.created_at_date: "7 days"]
    unless: [view_10528.id, view_10528.status]
  }

  join: view_10530 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10528.user_id} = ${view_10530.id} ;;
    required_joins: []
  }

  join: view_10531 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10528.account_id} = ${view_10531.account_id} ;;
    required_joins: [view_10530]
  }

  join: view_10532 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10528.category} = ${view_10532.category} ;;
  }

  access_filter: {
    field: view_10528.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10528.is_deleted} = false ;;
}
