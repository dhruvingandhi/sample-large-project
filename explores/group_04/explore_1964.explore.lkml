# Explore: explore_1964
# Auto-generated LookML Explore File

include: "/views/domain_43/view_05893.view.lkml"
include: "/views/domain_45/view_05895.view.lkml"
include: "/views/domain_46/view_05896.view.lkml"
include: "/views/domain_47/view_05897.view.lkml"

explore: explore_1964 {
  label: "Explore Explore 1964"
  description: "Comprehensive analytics explore joining base view_05893 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_05893
  
  always_filter: {
    filters: [view_05893.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05893.created_at_date: "7 days"]
    unless: [view_05893.id, view_05893.status]
  }

  join: view_05895 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05893.user_id} = ${view_05895.id} ;;
    required_joins: []
  }

  join: view_05896 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05893.account_id} = ${view_05896.account_id} ;;
    required_joins: [view_05895]
  }

  join: view_05897 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05893.category} = ${view_05897.category} ;;
  }

  access_filter: {
    field: view_05893.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05893.is_deleted} = false ;;
}
