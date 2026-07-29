# Explore: explore_2507
# Auto-generated LookML Explore File

include: "/views/domain_22/view_07522.view.lkml"
include: "/views/domain_24/view_07524.view.lkml"
include: "/views/domain_25/view_07525.view.lkml"
include: "/views/domain_26/view_07526.view.lkml"

explore: explore_2507 {
  label: "Explore Explore 2507"
  description: "Comprehensive analytics explore joining base view_07522 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_07522
  
  always_filter: {
    filters: [view_07522.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07522.created_at_date: "7 days"]
    unless: [view_07522.id, view_07522.status]
  }

  join: view_07524 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07522.user_id} = ${view_07524.id} ;;
    required_joins: []
  }

  join: view_07525 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07522.account_id} = ${view_07525.account_id} ;;
    required_joins: [view_07524]
  }

  join: view_07526 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07522.category} = ${view_07526.category} ;;
  }

  access_filter: {
    field: view_07522.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07522.is_deleted} = false ;;
}
