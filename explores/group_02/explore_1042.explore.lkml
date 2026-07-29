# Explore: explore_1042
# Auto-generated LookML Explore File

include: "/views/domain_27/view_03127.view.lkml"
include: "/views/domain_29/view_03129.view.lkml"
include: "/views/domain_30/view_03130.view.lkml"
include: "/views/domain_31/view_03131.view.lkml"

explore: explore_1042 {
  label: "Explore Explore 1042"
  description: "Comprehensive analytics explore joining base view_03127 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_03127
  
  always_filter: {
    filters: [view_03127.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03127.created_at_date: "7 days"]
    unless: [view_03127.id, view_03127.status]
  }

  join: view_03129 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03127.user_id} = ${view_03129.id} ;;
    required_joins: []
  }

  join: view_03130 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03127.account_id} = ${view_03130.account_id} ;;
    required_joins: [view_03129]
  }

  join: view_03131 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03127.category} = ${view_03131.category} ;;
  }

  access_filter: {
    field: view_03127.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03127.is_deleted} = false ;;
}
