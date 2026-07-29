# Explore: explore_0927
# Auto-generated LookML Explore File

include: "/views/domain_32/view_02782.view.lkml"
include: "/views/domain_34/view_02784.view.lkml"
include: "/views/domain_35/view_02785.view.lkml"
include: "/views/domain_36/view_02786.view.lkml"

explore: explore_0927 {
  label: "Explore Explore 0927"
  description: "Comprehensive analytics explore joining base view_02782 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_02782
  
  always_filter: {
    filters: [view_02782.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02782.created_at_date: "7 days"]
    unless: [view_02782.id, view_02782.status]
  }

  join: view_02784 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02782.user_id} = ${view_02784.id} ;;
    required_joins: []
  }

  join: view_02785 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02782.account_id} = ${view_02785.account_id} ;;
    required_joins: [view_02784]
  }

  join: view_02786 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02782.category} = ${view_02786.category} ;;
  }

  access_filter: {
    field: view_02782.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02782.is_deleted} = false ;;
}
