# Explore: explore_3593
# Auto-generated LookML Explore File

include: "/views/domain_30/view_10780.view.lkml"
include: "/views/domain_32/view_10782.view.lkml"
include: "/views/domain_33/view_10783.view.lkml"
include: "/views/domain_34/view_10784.view.lkml"

explore: explore_3593 {
  label: "Explore Explore 3593"
  description: "Comprehensive analytics explore joining base view_10780 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_10780
  
  always_filter: {
    filters: [view_10780.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10780.created_at_date: "7 days"]
    unless: [view_10780.id, view_10780.status]
  }

  join: view_10782 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10780.user_id} = ${view_10782.id} ;;
    required_joins: []
  }

  join: view_10783 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10780.account_id} = ${view_10783.account_id} ;;
    required_joins: [view_10782]
  }

  join: view_10784 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10780.category} = ${view_10784.category} ;;
  }

  access_filter: {
    field: view_10780.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10780.is_deleted} = false ;;
}
