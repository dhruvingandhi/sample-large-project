# Explore: explore_2474
# Auto-generated LookML Explore File

include: "/views/domain_23/view_07423.view.lkml"
include: "/views/domain_25/view_07425.view.lkml"
include: "/views/domain_26/view_07426.view.lkml"
include: "/views/domain_27/view_07427.view.lkml"

explore: explore_2474 {
  label: "Explore Explore 2474"
  description: "Comprehensive analytics explore joining base view_07423 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_07423
  
  always_filter: {
    filters: [view_07423.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07423.created_at_date: "7 days"]
    unless: [view_07423.id, view_07423.status]
  }

  join: view_07425 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07423.user_id} = ${view_07425.id} ;;
    required_joins: []
  }

  join: view_07426 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07423.account_id} = ${view_07426.account_id} ;;
    required_joins: [view_07425]
  }

  join: view_07427 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07423.category} = ${view_07427.category} ;;
  }

  access_filter: {
    field: view_07423.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07423.is_deleted} = false ;;
}
