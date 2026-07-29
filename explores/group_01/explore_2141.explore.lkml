# Explore: explore_2141
# Auto-generated LookML Explore File

include: "/views/domain_24/view_06424.view.lkml"
include: "/views/domain_26/view_06426.view.lkml"
include: "/views/domain_27/view_06427.view.lkml"
include: "/views/domain_28/view_06428.view.lkml"

explore: explore_2141 {
  label: "Explore Explore 2141"
  description: "Comprehensive analytics explore joining base view_06424 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_06424
  
  always_filter: {
    filters: [view_06424.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06424.created_at_date: "7 days"]
    unless: [view_06424.id, view_06424.status]
  }

  join: view_06426 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06424.user_id} = ${view_06426.id} ;;
    required_joins: []
  }

  join: view_06427 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06424.account_id} = ${view_06427.account_id} ;;
    required_joins: [view_06426]
  }

  join: view_06428 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06424.category} = ${view_06428.category} ;;
  }

  access_filter: {
    field: view_06424.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06424.is_deleted} = false ;;
}
