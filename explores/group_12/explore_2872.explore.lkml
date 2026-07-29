# Explore: explore_2872
# Auto-generated LookML Explore File

include: "/views/domain_17/view_08617.view.lkml"
include: "/views/domain_19/view_08619.view.lkml"
include: "/views/domain_20/view_08620.view.lkml"
include: "/views/domain_21/view_08621.view.lkml"

explore: explore_2872 {
  label: "Explore Explore 2872"
  description: "Comprehensive analytics explore joining base view_08617 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_08617
  
  always_filter: {
    filters: [view_08617.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08617.created_at_date: "7 days"]
    unless: [view_08617.id, view_08617.status]
  }

  join: view_08619 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08617.user_id} = ${view_08619.id} ;;
    required_joins: []
  }

  join: view_08620 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08617.account_id} = ${view_08620.account_id} ;;
    required_joins: [view_08619]
  }

  join: view_08621 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08617.category} = ${view_08621.category} ;;
  }

  access_filter: {
    field: view_08617.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08617.is_deleted} = false ;;
}
