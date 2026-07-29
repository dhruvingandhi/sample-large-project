# Explore: explore_0908
# Auto-generated LookML Explore File

include: "/views/domain_25/view_02725.view.lkml"
include: "/views/domain_27/view_02727.view.lkml"
include: "/views/domain_28/view_02728.view.lkml"
include: "/views/domain_29/view_02729.view.lkml"

explore: explore_0908 {
  label: "Explore Explore 0908"
  description: "Comprehensive analytics explore joining base view_02725 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_02725
  
  always_filter: {
    filters: [view_02725.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02725.created_at_date: "7 days"]
    unless: [view_02725.id, view_02725.status]
  }

  join: view_02727 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02725.user_id} = ${view_02727.id} ;;
    required_joins: []
  }

  join: view_02728 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02725.account_id} = ${view_02728.account_id} ;;
    required_joins: [view_02727]
  }

  join: view_02729 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02725.category} = ${view_02729.category} ;;
  }

  access_filter: {
    field: view_02725.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02725.is_deleted} = false ;;
}
