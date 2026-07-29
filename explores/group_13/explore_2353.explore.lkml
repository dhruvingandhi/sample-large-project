# Explore: explore_2353
# Auto-generated LookML Explore File

include: "/views/domain_10/view_07060.view.lkml"
include: "/views/domain_12/view_07062.view.lkml"
include: "/views/domain_13/view_07063.view.lkml"
include: "/views/domain_14/view_07064.view.lkml"

explore: explore_2353 {
  label: "Explore Explore 2353"
  description: "Comprehensive analytics explore joining base view_07060 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_07060
  
  always_filter: {
    filters: [view_07060.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07060.created_at_date: "7 days"]
    unless: [view_07060.id, view_07060.status]
  }

  join: view_07062 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07060.user_id} = ${view_07062.id} ;;
    required_joins: []
  }

  join: view_07063 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07060.account_id} = ${view_07063.account_id} ;;
    required_joins: [view_07062]
  }

  join: view_07064 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07060.category} = ${view_07064.category} ;;
  }

  access_filter: {
    field: view_07060.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07060.is_deleted} = false ;;
}
