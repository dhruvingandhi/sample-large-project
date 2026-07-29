# Explore: explore_0890
# Auto-generated LookML Explore File

include: "/views/domain_21/view_02671.view.lkml"
include: "/views/domain_23/view_02673.view.lkml"
include: "/views/domain_24/view_02674.view.lkml"
include: "/views/domain_25/view_02675.view.lkml"

explore: explore_0890 {
  label: "Explore Explore 0890"
  description: "Comprehensive analytics explore joining base view_02671 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_02671
  
  always_filter: {
    filters: [view_02671.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02671.created_at_date: "7 days"]
    unless: [view_02671.id, view_02671.status]
  }

  join: view_02673 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02671.user_id} = ${view_02673.id} ;;
    required_joins: []
  }

  join: view_02674 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02671.account_id} = ${view_02674.account_id} ;;
    required_joins: [view_02673]
  }

  join: view_02675 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02671.category} = ${view_02675.category} ;;
  }

  access_filter: {
    field: view_02671.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02671.is_deleted} = false ;;
}
