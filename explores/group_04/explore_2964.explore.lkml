# Explore: explore_2964
# Auto-generated LookML Explore File

include: "/views/domain_43/view_08893.view.lkml"
include: "/views/domain_45/view_08895.view.lkml"
include: "/views/domain_46/view_08896.view.lkml"
include: "/views/domain_47/view_08897.view.lkml"

explore: explore_2964 {
  label: "Explore Explore 2964"
  description: "Comprehensive analytics explore joining base view_08893 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_08893
  
  always_filter: {
    filters: [view_08893.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08893.created_at_date: "7 days"]
    unless: [view_08893.id, view_08893.status]
  }

  join: view_08895 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08893.user_id} = ${view_08895.id} ;;
    required_joins: []
  }

  join: view_08896 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08893.account_id} = ${view_08896.account_id} ;;
    required_joins: [view_08895]
  }

  join: view_08897 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08893.category} = ${view_08897.category} ;;
  }

  access_filter: {
    field: view_08893.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08893.is_deleted} = false ;;
}
