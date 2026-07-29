# Explore: explore_2916
# Auto-generated LookML Explore File

include: "/views/domain_49/view_08749.view.lkml"
include: "/views/domain_01/view_08751.view.lkml"
include: "/views/domain_02/view_08752.view.lkml"
include: "/views/domain_03/view_08753.view.lkml"

explore: explore_2916 {
  label: "Explore Explore 2916"
  description: "Comprehensive analytics explore joining base view_08749 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_08749
  
  always_filter: {
    filters: [view_08749.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08749.created_at_date: "7 days"]
    unless: [view_08749.id, view_08749.status]
  }

  join: view_08751 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08749.user_id} = ${view_08751.id} ;;
    required_joins: []
  }

  join: view_08752 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08749.account_id} = ${view_08752.account_id} ;;
    required_joins: [view_08751]
  }

  join: view_08753 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08749.category} = ${view_08753.category} ;;
  }

  access_filter: {
    field: view_08749.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08749.is_deleted} = false ;;
}
