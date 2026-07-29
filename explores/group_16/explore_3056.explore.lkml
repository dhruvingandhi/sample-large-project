# Explore: explore_3056
# Auto-generated LookML Explore File

include: "/views/domain_19/view_09169.view.lkml"
include: "/views/domain_21/view_09171.view.lkml"
include: "/views/domain_22/view_09172.view.lkml"
include: "/views/domain_23/view_09173.view.lkml"

explore: explore_3056 {
  label: "Explore Explore 3056"
  description: "Comprehensive analytics explore joining base view_09169 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_09169
  
  always_filter: {
    filters: [view_09169.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09169.created_at_date: "7 days"]
    unless: [view_09169.id, view_09169.status]
  }

  join: view_09171 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09169.user_id} = ${view_09171.id} ;;
    required_joins: []
  }

  join: view_09172 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09169.account_id} = ${view_09172.account_id} ;;
    required_joins: [view_09171]
  }

  join: view_09173 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09169.category} = ${view_09173.category} ;;
  }

  access_filter: {
    field: view_09169.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09169.is_deleted} = false ;;
}
