# Explore: explore_3872
# Auto-generated LookML Explore File

include: "/views/domain_17/view_11617.view.lkml"
include: "/views/domain_19/view_11619.view.lkml"
include: "/views/domain_20/view_11620.view.lkml"
include: "/views/domain_21/view_11621.view.lkml"

explore: explore_3872 {
  label: "Explore Explore 3872"
  description: "Comprehensive analytics explore joining base view_11617 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_11617
  
  always_filter: {
    filters: [view_11617.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11617.created_at_date: "7 days"]
    unless: [view_11617.id, view_11617.status]
  }

  join: view_11619 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11617.user_id} = ${view_11619.id} ;;
    required_joins: []
  }

  join: view_11620 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11617.account_id} = ${view_11620.account_id} ;;
    required_joins: [view_11619]
  }

  join: view_11621 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11617.category} = ${view_11621.category} ;;
  }

  access_filter: {
    field: view_11617.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11617.is_deleted} = false ;;
}
