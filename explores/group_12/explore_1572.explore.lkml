# Explore: explore_1572
# Auto-generated LookML Explore File

include: "/views/domain_17/view_04717.view.lkml"
include: "/views/domain_19/view_04719.view.lkml"
include: "/views/domain_20/view_04720.view.lkml"
include: "/views/domain_21/view_04721.view.lkml"

explore: explore_1572 {
  label: "Explore Explore 1572"
  description: "Comprehensive analytics explore joining base view_04717 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_04717
  
  always_filter: {
    filters: [view_04717.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04717.created_at_date: "7 days"]
    unless: [view_04717.id, view_04717.status]
  }

  join: view_04719 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04717.user_id} = ${view_04719.id} ;;
    required_joins: []
  }

  join: view_04720 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04717.account_id} = ${view_04720.account_id} ;;
    required_joins: [view_04719]
  }

  join: view_04721 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04717.category} = ${view_04721.category} ;;
  }

  access_filter: {
    field: view_04717.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04717.is_deleted} = false ;;
}
