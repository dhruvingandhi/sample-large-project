# Explore: explore_0872
# Auto-generated LookML Explore File

include: "/views/domain_17/view_02617.view.lkml"
include: "/views/domain_19/view_02619.view.lkml"
include: "/views/domain_20/view_02620.view.lkml"
include: "/views/domain_21/view_02621.view.lkml"

explore: explore_0872 {
  label: "Explore Explore 0872"
  description: "Comprehensive analytics explore joining base view_02617 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_02617
  
  always_filter: {
    filters: [view_02617.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02617.created_at_date: "7 days"]
    unless: [view_02617.id, view_02617.status]
  }

  join: view_02619 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02617.user_id} = ${view_02619.id} ;;
    required_joins: []
  }

  join: view_02620 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02617.account_id} = ${view_02620.account_id} ;;
    required_joins: [view_02619]
  }

  join: view_02621 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02617.category} = ${view_02621.category} ;;
  }

  access_filter: {
    field: view_02617.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02617.is_deleted} = false ;;
}
