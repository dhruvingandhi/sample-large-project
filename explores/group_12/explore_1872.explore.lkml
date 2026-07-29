# Explore: explore_1872
# Auto-generated LookML Explore File

include: "/views/domain_17/view_05617.view.lkml"
include: "/views/domain_19/view_05619.view.lkml"
include: "/views/domain_20/view_05620.view.lkml"
include: "/views/domain_21/view_05621.view.lkml"

explore: explore_1872 {
  label: "Explore Explore 1872"
  description: "Comprehensive analytics explore joining base view_05617 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_05617
  
  always_filter: {
    filters: [view_05617.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05617.created_at_date: "7 days"]
    unless: [view_05617.id, view_05617.status]
  }

  join: view_05619 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05617.user_id} = ${view_05619.id} ;;
    required_joins: []
  }

  join: view_05620 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05617.account_id} = ${view_05620.account_id} ;;
    required_joins: [view_05619]
  }

  join: view_05621 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05617.category} = ${view_05621.category} ;;
  }

  access_filter: {
    field: view_05617.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05617.is_deleted} = false ;;
}
