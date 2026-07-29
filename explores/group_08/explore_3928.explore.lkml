# Explore: explore_3928
# Auto-generated LookML Explore File

include: "/views/domain_35/view_11785.view.lkml"
include: "/views/domain_37/view_11787.view.lkml"
include: "/views/domain_38/view_11788.view.lkml"
include: "/views/domain_39/view_11789.view.lkml"

explore: explore_3928 {
  label: "Explore Explore 3928"
  description: "Comprehensive analytics explore joining base view_11785 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_11785
  
  always_filter: {
    filters: [view_11785.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11785.created_at_date: "7 days"]
    unless: [view_11785.id, view_11785.status]
  }

  join: view_11787 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11785.user_id} = ${view_11787.id} ;;
    required_joins: []
  }

  join: view_11788 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11785.account_id} = ${view_11788.account_id} ;;
    required_joins: [view_11787]
  }

  join: view_11789 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11785.category} = ${view_11789.category} ;;
  }

  access_filter: {
    field: view_11785.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11785.is_deleted} = false ;;
}
