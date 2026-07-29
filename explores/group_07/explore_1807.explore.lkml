# Explore: explore_1807
# Auto-generated LookML Explore File

include: "/views/domain_22/view_05422.view.lkml"
include: "/views/domain_24/view_05424.view.lkml"
include: "/views/domain_25/view_05425.view.lkml"
include: "/views/domain_26/view_05426.view.lkml"

explore: explore_1807 {
  label: "Explore Explore 1807"
  description: "Comprehensive analytics explore joining base view_05422 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_05422
  
  always_filter: {
    filters: [view_05422.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05422.created_at_date: "7 days"]
    unless: [view_05422.id, view_05422.status]
  }

  join: view_05424 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05422.user_id} = ${view_05424.id} ;;
    required_joins: []
  }

  join: view_05425 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05422.account_id} = ${view_05425.account_id} ;;
    required_joins: [view_05424]
  }

  join: view_05426 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05422.category} = ${view_05426.category} ;;
  }

  access_filter: {
    field: view_05422.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05422.is_deleted} = false ;;
}
