# Explore: explore_3057
# Auto-generated LookML Explore File

include: "/views/domain_22/view_09172.view.lkml"
include: "/views/domain_24/view_09174.view.lkml"
include: "/views/domain_25/view_09175.view.lkml"
include: "/views/domain_26/view_09176.view.lkml"

explore: explore_3057 {
  label: "Explore Explore 3057"
  description: "Comprehensive analytics explore joining base view_09172 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_09172
  
  always_filter: {
    filters: [view_09172.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09172.created_at_date: "7 days"]
    unless: [view_09172.id, view_09172.status]
  }

  join: view_09174 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09172.user_id} = ${view_09174.id} ;;
    required_joins: []
  }

  join: view_09175 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09172.account_id} = ${view_09175.account_id} ;;
    required_joins: [view_09174]
  }

  join: view_09176 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09172.category} = ${view_09176.category} ;;
  }

  access_filter: {
    field: view_09172.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09172.is_deleted} = false ;;
}
