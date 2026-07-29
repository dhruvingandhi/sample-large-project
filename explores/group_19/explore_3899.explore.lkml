# Explore: explore_3899
# Auto-generated LookML Explore File

include: "/views/domain_48/view_11698.view.lkml"
include: "/views/domain_50/view_11700.view.lkml"
include: "/views/domain_01/view_11701.view.lkml"
include: "/views/domain_02/view_11702.view.lkml"

explore: explore_3899 {
  label: "Explore Explore 3899"
  description: "Comprehensive analytics explore joining base view_11698 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_11698
  
  always_filter: {
    filters: [view_11698.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11698.created_at_date: "7 days"]
    unless: [view_11698.id, view_11698.status]
  }

  join: view_11700 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11698.user_id} = ${view_11700.id} ;;
    required_joins: []
  }

  join: view_11701 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11698.account_id} = ${view_11701.account_id} ;;
    required_joins: [view_11700]
  }

  join: view_11702 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11698.category} = ${view_11702.category} ;;
  }

  access_filter: {
    field: view_11698.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11698.is_deleted} = false ;;
}
